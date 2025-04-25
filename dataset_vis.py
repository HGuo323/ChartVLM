from datasets import load_dataset
from PIL import Image
from io import BytesIO

dataset = load_dataset('ahmed-masry/ChartGemma')

for i in range(1, 2000, 100):
    image = Image.open(BytesIO(dataset['train'][i]['image']))
    print(dataset['train'][i]['input'])
    image.show()
