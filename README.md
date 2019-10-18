# SandyModels
3D Модели для SandyApp

## Структура

- [Assets/ForTests]() - Содержит общие [префабы](https://docs.unity3d.com/ru/current/Manual/Prefabs.html) для тестовых сцен (ландшафт, камера и т.д.)
- **Assets/[имя группы объектов]/**
  - ***.unity** - тестовые сцены (например [Assets/Plants/plants.unity]())
  - **Models/** - папка с моделями
    - ***.FBX** - меш модели (например [Assets/Plants/Models/baum hd med fbx.FBX]())
    - **Materials/** - материалы
    - **Textures/** - текстуры
    - **Animations/** - анимации и/или аниматоры
    - **Prefabs/** - [префабы](https://docs.unity3d.com/ru/current/Manual/Prefabs.html) - готовые GameObject моделей с накинутыми материалами, анимациями и т.д.
- [Assets/ThirdParty]() - сторонние паки моделей (если нужно их хранить), из которых копируем отдельные модели, текстуры и т.д.
