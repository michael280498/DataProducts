import streamlit as st
import pandas as pd
import numpy as np
import time
import math

st.write('UBER PICKUPS TEST')

data = 'https://s3-us-west-2.amazonaws.com/streamlit-demo-data/uber-raw-data-sep14.csv.gz'

@st.cache
def download_data():
    return(pd.read_csv(data).
    rename(columns={'Lat':'lat','Lon':'lon'})

    )


df = download_data()
df2 = df
page_size = 1000
total_pages = math.ceil(len(df)/page_size)
start_value = 0
slider = st.slider('select the page',1,total_pages)

st.write('Page selected', slider, 'with limits',(((slider-1)*page_size),(slider*page_size)-1))
df = df.loc[((slider-1)*page_size):(slider*page_size)-1]
df
st.map(df)

"""
## EJERCICIO

"""

df2['Date/Time'] = pd.to_datetime(df2['Date/Time'], errors='coerce')
df2['hour'] = df2['Date/Time'].dt.hour.values
bar = df2.groupby(['hour']).size()
st.bar_chart(bar)


another_slider = st.sidebar.slider('Select Range: ',0,23,(5,15))
st.sidebar.write('The range selected is',another_slider)

df2 = df2.loc[df2.loc[:, 'hour'] >= another_slider[0]]
df2 = df2.loc[df2.loc[:, 'hour'] <= another_slider[1]]

page_size2 = 1000
total_pages2 = math.ceil(len(df2)/page_size)
start_value2 = 0
slider2 = st.slider('select the page',1,total_pages2)
st.write('Page selected', slider2, 'with limits',(((slider2-1)*page_size2),(slider2*page_size2)-1))
df2 = df2.loc[((slider2-1)*page_size2):(slider2*page_size2)-1]

df2
st.map(df2)