import { Suspense, lazy } from 'react';

import SuspenseLoader from 'src/components/SuspenseLoader';
import Guest from 'src/components/Guest';

const Loader = (Component) => (props) =>
  (
    <Suspense fallback={<SuspenseLoader />}>
      <Component {...props} />
    </Suspense>
  );

const Register = Loader(
  lazy(() => import('src/content/pages/Auth/Register/Basic'))
);

const RecoverPassword = Loader(
  lazy(() => import('src/content/pages/Auth/RecoverPassword'))
);

const accountRoutes = [
  {
    path: 'register',
    element: (
      <Guest>
        <Register />
      </Guest>
    )
  },
  {
    path: 'recover-password',
    element: <RecoverPassword />
  }
];

export default accountRoutes;
