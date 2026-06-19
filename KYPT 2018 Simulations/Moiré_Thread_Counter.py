import matplotlib.pyplot as plt
import numpy as np
import matplotlib.animation as ani
'''
a = 0.1
x0 = 0.0
y0 = 0.0
'''
M = 5.0


fig = plt.figure(0)
ax = plt.axes(xlim = (-M, M), ylim = (-M, M))
lines = []

def strand(a, x0, y0, theta):
    u = 0.0
    v = 0.0
    if ( np.mod(theta, np.pi) == 0 ):
        for i in range(int(-(M+y0)/a), int((M-y0)/a)+1):
            lines.extend(ax.plot([-M,M],[y0+a*i,y0+a*i], 'k-', linewidth=1.0))
    elif ( np.mod(theta,np.pi) == np.pi/2 ):
        for i in range(int(-(M+x0)/a),int((M-x0)/a)+1):
            lines.extend(ax.plot([x0+a*i,x0+a*i],[-M,M], 'k-', linewidth=1.0))
    else:
        for i in range(int( (-(M * np.sqrt(2) * np.maximum( np.abs(np.cos(np.pi*0.75-theta)), np.abs(np.sin(np.pi*0.75-theta)) )\
                              + y0 * np.cos(theta) - x0 * np.sin(theta))) / a ),\
                       1 + int(((M * np.sqrt(2) * np.maximum( np.abs(np.cos(np.pi*0.75-theta)), np.abs(np.sin(np.pi*0.75-theta)) )\
                              - y0 * np.cos(theta) + x0 * np.sin(theta))) / a)):
            u = np.sort([-M, M, x0 + i*a/np.sin(theta) + (M-y0)/np.tan(theta), x0 + i*a/np.sin(theta) + (-M-y0)/np.tan(theta)])[1]
            v = np.sort([-M, M, x0 + i*a/np.sin(theta) + (M-y0)/np.tan(theta), x0 + i*a/np.sin(theta) + (-M-y0)/np.tan(theta)])[2]
            lines.extend(ax.plot([u,v],[y0 - i*a/np.cos(theta) + (u-x0)*np.tan(theta), y0 - i*a/np.cos(theta) + (v-x0)*np.tan(theta)], 'k-', linewidth=1.0))

def denim(a, x0, y0, theta, M):
    u = 0.0
    v = 0.0
    if ( np.mod(theta, np.pi) == 0 ):
        for i in range(int(-(M+y0)/a), int((M-y0)/a)+1):
            lines.extend(ax.plot([-M,M],[y0+a*i,y0+a*i], 'k-', linewidth=1.0))
    elif ( np.mod(theta,np.pi) == np.pi/2 ):
        for i in range(int(-(M+x0)/a),int((M-x0)/a)+1):
            lines.extend(ax.plot([x0+a*i,x0+a*i],[-M,M], 'k-', linewidth=1.0))
    else:
        for i in range(int( (-(M * np.sqrt(2) * np.maximum( np.abs(np.cos(np.pi*0.75-theta)), np.abs(np.sin(np.pi*0.75-theta)) )\
                              + y0 * np.cos(theta) - x0 * np.sin(theta))) / a ),\
                       1 + int(((M * np.sqrt(2) * np.maximum( np.abs(np.cos(np.pi*0.75-theta)), np.abs(np.sin(np.pi*0.75-theta)) )\
                              - y0 * np.cos(theta) + x0 * np.sin(theta))) / a)):
            u = np.sort([-M, M, x0 + i*a/np.sin(theta) + (M-y0)/np.tan(theta), x0 + i*a/np.sin(theta) + (-M-y0)/np.tan(theta)])[1]
            v = np.sort([-M, M, x0 + i*a/np.sin(theta) + (M-y0)/np.tan(theta), x0 + i*a/np.sin(theta) + (-M-y0)/np.tan(theta)])[2]
            lines.extend(ax.plot([u,v],[y0 - i*a/np.cos(theta) + (u-x0)*np.tan(theta), y0 - i*a/np.cos(theta) + (v-x0)*np.tan(theta)], 'k-', linewidth=1.0))

def fabric(a, b, x, y, theta):
    strand(a, x, y, theta)
    strand(b, x, y, theta + np.pi/2)

#def denfab(a, x0, y0, theta):



'''
for i in range(1, n+m+1):
    fabric(0.1, 0.1, 0.0, 0.0, 0.05 * (i-1), n, m, i)
    strand(0.11, 0.0, 0.0, 0.1 * (i-1), n, m, i)
'''

def init():
#    del lines[:]
    return lines

def animate(i):
    del lines[:]
    strand(0.19, 0, 0, 0.02 * i)
    fabric(0.1, 0.1, 0, 0, 0.0)
    return lines

#strand(0.11, 0, 0, 0.01)
#strand(0.1, 0, 0, 0.0)
#strand( 0.1, 0.03, 0.03, 0.0)

#plt.show()
anim = ani.FuncAnimation(fig, animate, frames = 100, init_func = init, interval = 200, blit=True)

plt.show()
#anim.save('Moire_Thread_Counter3.mp4')
'''
print('Saving Start')
Writer = ani.writers['ffmpeg']
writer = Writer(metadata=dict(artist='Me'), bitrate=5000)
anim.save('Moire_Thread_Counter4.mp4', writer= writer)
'''

#plt.show()

'''
plt.figure(0)

fabric(float(0.1), float(0.1), float(0), float(0), float(0))
#fabric(0.1,0.1,0.02,0.02,0)
#fabric(0.1,0.1,0,0,0)
#fabric(0.1,0.1,0.02,0.02,0)
strand(float(0.11), float(0), float(0), float(0.0))

plt.show()

plt.figure(1)
fabric(float(0.1), float(0.1), float(0), float(0), float(0))
strand(float(0.11), float(0), float(0), float(0.2))


fabric(0.1, 0.1, 0, 0, 0, 1, 1, 1)
strand(0.11, 0, 0, 2 * np.pi/10, 1, 1, 1)
plt.show()

'''