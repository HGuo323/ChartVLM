import os

path = 'test0.1'
with open(path, 'r') as f:
    data = f.readlines()

pred = []
ans = []
pred_count = 0
ans_count = 0
for line in data:
    if 'Prediction:' in line:
        pred.append(line.split(': ')[1])
        pred_count += 1
    elif 'Answer:' in line:
        ans.append(line.split(': ')[1])
        ans_count += 1

assert pred_count == ans_count

total_test_points = pred_count
print(total_test_points)

correct_count = 0
for i in range(total_test_points):
    if pred[i] == ans[i]:
        correct_count += 1

print(correct_count / total_test_points)


