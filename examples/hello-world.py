from sklearn.datasets import load_iris

print("start")

iris = load_iris()

print(iris.feature_names)
print(iris.target_names)
print(iris.data[0])
for i in range(len(iris.target)):
    print("Row %d: %s => %s" % (i, iris.data[i], iris.target[i]))

