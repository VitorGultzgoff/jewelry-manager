import { Suspense, lazy } from 'react';

import SuspenseLoader from 'src/components/SuspenseLoader';
import Guest from 'src/components/Guest';

const Loader = (Component) => (props) =>
  (
    <Suspense fallback={<SuspenseLoader />}>
      <Component {...props} />
    </Suspense>
  );

// Account

const RegisterCover = Loader(
  lazy(() => import('src/content/pages/Auth/Register/Cover'))
);
const RegisterBasic = Loader(
  lazy(() => import('src/content/pages/Auth/Register/Basic'))
);
const RegisterWizard = Loader(
  lazy(() => import('src/content/pages/Auth/Register/Wizard'))
);

const RecoverPassword = Loader(
  lazy(() => import('src/content/pages/Auth/RecoverPassword'))
);

const accountRoutes = [
  {
    path: 'register',
    element: (
      <Guest>
        <RegisterCover />
      </Guest>
    )
  },
  {
    path: 'recover-password',
    element: <RecoverPassword />
  },
  {
    path: 'register',
    element: (
      <Guest>
        <RegisterCover />
      </Guest>
    )
  },
  {
    path: 'register-basic',
    element: <RegisterBasic />
  },
  {
    path: 'register-cover',
    element: <RegisterCover />
  },
  {
    path: 'register-wizard',
    element: <RegisterWizard />
  }
];

export default accountRoutes;
