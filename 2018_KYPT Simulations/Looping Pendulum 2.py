import numpy as np
import matplotlib.pyplot as plt
steps=300000
flag=0
u=0
v=0
h=np.zeros(steps)
t=np.zeros(steps)
hd=np.zeros(steps)
td=np.zeros(steps)
hdd=np.zeros(steps)
tdd=np.zeros(steps)
a=0.003
L=1.143

mu=0.27
g=9.8
mr=np.linspace(6.5,12.5,100)


E=np.zeros(100)
for j in range(100):
    h=np.zeros(steps)
    t=np.zeros(steps)
    hd=np.zeros(steps)
    td=np.zeros(steps)
    hdd=np.zeros(steps)
    tdd=np.zeros(steps)
    h[0]=0.4
    t[0]=np.pi*3/4
    tdd[0]=g*np.sin(t[0])/(L-h[0]-a*t[0])
    hdd[0]=g*(mr[j]*np.exp(-mu*t[0])+np.cos(t[0]))/(1+mr[j]*np.exp(-mu*t[0]))
    for i in range(0, steps-1):
        h[i+1]=h[i]+hd[i]*0.0001
        t[i+1]=t[i]+td[i]*0.0001
        hd[i+1]=hd[i]+hdd[i]*0.0001
        td[i+1]=td[i]+tdd[i]*0.0001
        hdd[i+1]=(g*mr[j]*np.exp(-mu*t[i+1])+g*np.cos(t[i+1])-(td[i+1]**2)*(L-h[i+1]-a*t[i+1]))/(1+mr[j]*np.exp(-mu*t[i+1]))
        tdd[i+1]=(g*np.sin(t[i+1])+a*(td[i+1]**2)+2*hd[i+1]*td[i+1])/(L-h[i+1]-a*t[i+1])
        if(hd[i]>0 and hd[i+1]<=0):
            u=i
            break
    for i in range(u,steps-1):
        h[i+1]=h[i]
        t[i+1]=t[i]+td[i]*0.0001
        td[i+1]=td[i]+tdd[i]*0.0001
        tdd[i+1]=(g*np.sin(t[i])+a*(td[i]**2))/(L-h[i]-a*t[i])
        if(L-h[i+1]-a*t[i+1]<=0):
            v=i
            break
        if(t[i+1]<t[i]):
            v=i
            break
#x=np.zeros(steps)
#y=np.zeros(steps)
#for i in range(steps):
#    x[i]=-a*np.cos(t[i])+(L-h[i]-a*t[i])*np.sin(t[i])
#    y[i]=a*np.sin(t[i])+(L-h[i]-a*t[i])*np.cos(t[i])
#if(v):plt.scatter(x[:v],y[:v],1)
#else: plt.scatter(x,y,1)
#plt.scatter([-a]*u,[-x for x in h[:u]],1)
#plt.plot(np.linspace(0,0.001*steps,steps),hd)
    E[j]=0.00421*((((-hd[u]*np.sin(t[j])+(L-h[u]-a*t[u])*td[u]*np.cos(t[u]))**2 + (-hd[u]*np.cos(t[u])-(L-h[u]-a*t[u])*td[u]*np.sin(t[u]))**2)/2 + g*(a*np.sin(t[u])+(L-h[u]-a*t[u])*np.cos(t[u]))))
#plt.plot(np.linspace(0,0.0001*steps,steps),E[:steps],1)
plt.plot(mr,E)
plt.show()
