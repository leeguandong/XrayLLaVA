import json

# JSON 文件路径
file_path = r'E:\comprehensive_library\e_commerce_lmm\data\openi-zh-prompt.json'

# 从文件中读取和解析 JSON 数据
with open(file_path, 'r', encoding='utf-8') as f:
    raw_data = json.load(f)

# 转换数据
converted_data = [{"query": item["prompt"], "response": item["label"], "images": [item["img"]]} for item in raw_data]

# 以 JSON 的形式将结果写入到一个新的文件中
with open('../data/open-zh-swift-llava-prompt.json', 'w', encoding='utf-8') as f:
    json.dump(converted_data, f, ensure_ascii=False, indent=4)
