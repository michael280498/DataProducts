import streamlit as st
import pandas as pd
import numpy as np
import time

st.title("This is my first streamlit app")
x=4
st.write(x, 'square is,',x**2)

st.write('Now using Dataframes...')

"""
## Let's use some frames

"""

chart_df = pd.DataFrame(
    np.random.randn(20,3),
    columns=['A','B','C']

)
st.line_chart(chart_df)

"""
## How about a map

"""
map_df=pd.DataFrame(
    np.random.randn(1000,2) / [50,50] + [37.76,-122.4],
    columns=['lat','lon']

)
st.map(map_df)

"""
## Show some widgets

"""

"""
### A checkbox

"""
if st.checkbox('show me the dataframe'):
    map_df



"""
### Slidertest

"""
x = st.slider('Select value for X')
st.write(x, 'square is,',x**2)


"""
### Options

"""

option = st.selectbox(
    'which number do you like best?',
    [1,2,3,4,5,6,7,8,9,10]
)
'You selected option',option


"""
### Progressbar

"""
progress_bar_label = st.empty()
progress_bar=st.progress(0)

for i in range(101):
    progress_bar_label.text(f'ITERATION {i}')
    progress_bar.progress(i)
    time.sleep(0.05)

option_side=st.sidebar.selectbox('Choose your weapon', ['Handgun','Machinegun','knife'])
st.sidebar.write('Your weapon choice is: ',option_side)

another_slider = st.sidebar.slider('Select Range: ',0.0,100.0,(25.0,75.0))
st.sidebar.write('The range selected is',another_slider)




