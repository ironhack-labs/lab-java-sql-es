## TABLA ORIGINAL

| Author          | Title                       | WordCount | Views |
|-----------------|-----------------------------|-----------|-------|
| Maria Charlotte | Best Paint Colors           | 814       | 14    |
| Juan Perez      | Small Space Decorating Tips | 1146      | 221   |
| Maria Charlotte | Hot Accessories             | 986       | 105   |
| Maria Charlotte | Mixing Textures             | 765       | 22    |
| Juan Perez      | Kitchen Refresh             | 1242      | 307   |
| Maria Charlotte | Homemade Art Hacks          | 1002      | 193   |
| Gemma Alcocer   | Refinishing Wood Floors     | 1571      | 7542  |

# 1NF

| Author          | Title                       | WordCount | Views |
|-----------------|-----------------------------|-----------|-------|
| Maria Charlotte | Best Paint Colors           | 814       | 14    |
| Juan Perez      | Small Space Decorating Tips | 1146      | 221   |
| Maria Charlotte | Hot Accessories             | 986       | 105   |
| Maria Charlotte | Mixing Textures             | 765       | 22    |
| Juan Perez      | Kitchen Refresh             | 1242      | 307   |
| Maria Charlotte | Homemade Art Hacks          | 1002      | 193   |
| Gemma Alcocer   | Refinishing Wood Floors     | 1571      | 7542  |

# 2NF

| Id | Author          | Title                       | WordCount | Views |
|----|-----------------|-----------------------------|-----------|-------|
| 1  | Maria Charlotte | Best Paint Colors           | 814       | 14    |
| 2  | Juan Perez      | Small Space Decorating Tips | 1146      | 221   |
| 3  | Maria Charlotte | Hot Accessories             | 986       | 105   |
| 4  | Maria Charlotte | Mixing Textures             | 765       | 22    |
| 5  | Juan Perez      | Kitchen Refresh             | 1242      | 307   |
| 6  | Maria Charlotte | Homemade Art Hacks          | 1002      | 193   |
| 7  | Gemma Alcocer   | Refinishing Wood Floors     | 1571      | 7542  |

# 3NF


| AuthorId | Author          | 
|----------|-----------------|
| 1        | Maria Charlotte | 
| 2        | Juan Perez      | 
| 3        | Gemma Alcocer   | 



| TitleId | AuthorId | Title                       | WordCount | Views |
|---------|----------|-----------------------------|-----------|-------|
| 1       | 1        | Best Paint Colors           | 814       | 14    |
| 2       | 2        | Small Space Decorating Tips | 1146      | 221   |
| 3       | 1        | Hot Accessories             | 986       | 105   |
| 4       | 1        | Mixing Textures             | 765       | 22    |
| 5       | 2        | Kitchen Refresh             | 1242      | 307   |
| 6       | 1        | Homemade Art Hacks          | 1002      | 193   |
| 7       | 3        | Refinishing Wood Floors     | 1571      | 7542  |


