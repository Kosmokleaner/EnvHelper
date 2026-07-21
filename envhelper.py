try: 
    import torch 
except: 
    print("Torch: not installed!") 
 
if 'torch' in globals(): 
    print('Torch version =',torch.__version__) 
    print('torch.cuda.is_available() =', torch.cuda.is_available()) 
 
try: 
    import numpy 
except: 
    print("Numpy: not installed!") 
 
if 'numpy' in globals(): 
    print('Numpy version =',numpy.__version__) 
