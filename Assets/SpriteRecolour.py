import cv2

def b2r(item):
    output = item
    print(item)
    if (item == [40, 80, 166]).all():
            print("[40, 80, 166] -> [97, 19, 44]")
            output = [97, 19, 44]
    elif (item == [19, 153, 211]).all():
        print("[19, 153, 211] -> [178, 32, 42]")
        output = [178, 32, 42]
    elif (item == [85, 227, 211]).all():
        print("[85, 227, 211] -> [236, 114, 14]")
        output = [236, 114, 14]
    elif (item == [88, 175, 49 ]).all():
        print("[88, 175, 49 ] -> [19, 153, 211]")
        output = [19, 153, 211]
    elif (item == [29, 102, 72]).all():
        print("[29, 102, 72] -> [40, 80, 166]")
        output = [40, 80, 166]
    else:
        output
    print(output)
    return output

def b2g(item):
    output = item
    if (item == [40, 80, 166]).all():
            output = [29, 102, 72]
    elif (item == [19, 153, 211]).all():
        output = [88, 175, 49]
    elif (item == [85, 227, 211]).all():
        output = [199, 222, 84]
    elif (item == [88, 175, 49 ]).all():
        output = [236, 114, 14]
    elif (item == [29, 102, 72]).all():
        output = [97, 19, 44]
    else:
        output
    return output

def b2p(item):
    output = item
    if (item == [40, 80, 166]).all():
            output = [147, 37, 131]
    elif (item == [19, 153, 211]).all():
        output = [233, 96, 152]
    elif (item == [85, 227, 211]).all():
        output = [244, 178, 171]
    elif (item == [88, 175, 49 ]).all():
        output = [251, 192, 53]
    elif (item == [29, 102, 72]).all():
        output = [172, 114, 4]
    else:
        output
    return output

img = cv2.imread("sprite.png")   # reads an image in the BGR format
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
for item in img:
    for thing in item:
        thing = b2r(thing)


cv2.imwrite('output1.png',img)
'''
In order RGB
For GumBot:
Blue:
Dark    [40, 80, 166]
Mid     [19, 153, 211]
Light   [85, 227, 211]
On      [88, 175, 49 ]
Dim     [29, 102, 72]

Red:
[97, 19, 44]
[178, 32, 42]
[236, 114, 14]
[19, 153, 211]
[40, 80, 166]

Green:
[29, 102, 72]
[88, 175, 49]
[199, 222, 84]
[236, 114, 14]
[97, 19, 44]

Pink:
[147, 37, 131]
[233, 96, 152]
[244, 178, 171]
[251, 192, 53]
[172, 114, 4]
'''




