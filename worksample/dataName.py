# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd



def main():
    data = pd.read_csv('combin.txt', header = None)
    data.columns = ["a"]
    splitted = data['a'].apply(lambda x: pd.Series(list(x)))
    splitted.columns = ['B'+str(x) for x in splitted.columns]
    df2 = data.join(splitted)
    df2.drop(df2.columns[[0]], axis=1, inplace=True)
    left = pd.DataFrame(df2.iloc[:, 0:2])
    right = pd.DataFrame(df2.iloc[:,[0,2]])

    left['key'] = 1
    right['key'] = 1
    df4 = pd.merge(left, right, on='key')
    del df4['key']
    del df4['B0_y']
    print (df4)
    
    df4.to_csv(r'comb1.txt', header=None, index=None, sep=' ', mode='a')
  
if __name__== "__main__":
  main()
