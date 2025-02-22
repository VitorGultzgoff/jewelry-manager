import axios from 'axios';

const axiosInt = axios.create({ baseURL: 'http://localhost:3000/' });

axiosInt.interceptors.response.use(
  (response) => response,
  (error) =>
    Promise.reject(
      (error.response && error.response.data) || 'There is an error!'
    )
);

export default axiosInt;
