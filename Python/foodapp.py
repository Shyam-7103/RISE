import streamlit as st
import datetime

st.set_page_config(page_title='Food Ordering App', page_icon='🍔', layout='centered')

with st.form('food_form'):
    st.title('Food Ordering App')

    c1,c2 = st.columns(2)
    first_name = c1.text_input('First Name :', placeholder='Xander')
    last_name = c2.text_input('Last Name :', placeholder='Cage')

    # name = st.text_input('Enter your name :')

    city = st.selectbox('Select your city :', ['Ahmedabad', 'Surat', 'Vapi', 'Navsari', 'Vadodara', 'Vasad', 'Bhavnagar'])

    food_preference = st.multiselect('Select your food preference :', ['Veg', 'Non-Veg', 'Egg', 'Pure-veg', 'Vegan', 'Discounted'])

    how_much_time_food_ord_from_restaurant = st.slider('How much time you have ordered food from restaurant :', 0, 50, 0)

    gender = st.radio('Select your gender', ['Male', 'Female', 'Other'])

    dob = st.date_input('Select your date of birth :', datetime.date(2000, 1, 1))

    audio = st.audio_input('Upload your audio :')
    if audio:
        st.write('Message recorded successfully')
        st.audio(audio)

    feedback = st.text_area('Enter your feedback :')

    check = st.checkbox('I agree to your Terms and Conditions')

    submit = st.form_submit_button('Submit', type='primary', use_container_width=True)

    if submit:
        if first_name == '' or last_name == '':
            st.error('Please enter your Full Name.')
        elif check == False:
            st.error('Please agree to Our Terms and Conditions.')
        else:
            st.success('Your order is placed successfully!')
            st.balloons()
            st.write('Name : ', first_name, last_name)
            st.write('City :', city)
            st.write('Food Preference :',', '.join(food_preference))
            st.write('Past Time Orders :', how_much_time_food_ord_from_restaurant)
            st.write('Gender :', gender)
            st.write('Date of Birth :', dob)
            st.write('Feedback :', feedback)
            