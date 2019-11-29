// Upgrade NOTE: replaced '_Projector' with 'unity_Projector'
// Upgrade NOTE: replaced '_ProjectorClip' with 'unity_ProjectorClip'

Shader "Projector/Color" {
	Properties {
		_Color ("Main Color", Color) = (1,1,1,1)
		_MainTex ("Texture", 2D) = "" {}
		_ShadowTex ("Alpha", 2D) = "" {}
		//_FalloffTex ("FallOff", 2D) = "" {}
	}
	
	Subshader {
		Tags {"Queue"="Transparent"}
		Pass {
			ZWrite Off
			Blend SrcAlpha OneMinusSrcAlpha
			Offset -1, -1
	
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fog
			#include "UnityCG.cginc"
			
			struct v2f {
				float4 uvShadow : TEXCOORD0;
				float4 uvFalloff : TEXCOORD1;
				UNITY_FOG_COORDS(2)
				float4 pos : SV_POSITION;
			};
			
			float4x4 unity_Projector;
			float4x4 unity_ProjectorClip;
			
			v2f vert (float4 vertex : POSITION)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(vertex);
				o.uvShadow = mul (unity_Projector, vertex);
				//o.uvFalloff = mul (unity_ProjectorClip, vertex);
				UNITY_TRANSFER_FOG(o,o.pos);
				return o;
			}
			
			fixed4 _Color;
			sampler2D _ShadowTex;
			sampler2D _MainTex;
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 texS = tex2Dproj (_ShadowTex, UNITY_PROJ_COORD(i.uvShadow));
				fixed4 color = tex2Dproj (_MainTex, UNITY_PROJ_COORD(i.uvShadow));
				color.a *= texS.r;
				color *= _Color;

				UNITY_APPLY_FOG_COLOR(i.fogCoord, color, fixed4(0,0,0,0));
				return color;
			}
			ENDCG
		}
	}
}
