import { RouteObject } from 'react-router';

import Authenticated from 'src/components/Authenticated';
import { Navigate } from 'react-router-dom';

import BaseLayout from 'src/layouts/BaseLayout';
import CollapsedSidebarLayout from 'src/layouts/CollapsedSidebarLayout';

import dashboardsRoutes from './dashboards';
import blocksRoutes from './blocks';
import applicationsRoutes from './applications';
import managementRoutes from './management';
import accountRoutes from './account';
import baseRoutes from './base';

const router: RouteObject[] = [
  {
    path: 'account',
    children: accountRoutes
  },
  {
    path: '',
    element: <BaseLayout />,
    children: baseRoutes
  },

  {
    path: 'app',
    element: (
      <Authenticated>
        <CollapsedSidebarLayout />
      </Authenticated>
    ),
    children: [
      {
        path: '',
        element: <Navigate to="dashboards" replace />
      },
      {
        path: 'dashboards',
        children: dashboardsRoutes
      },
      {
        path: 'blocks',
        children: blocksRoutes
      },
      {
        path: 'applications',
        children: applicationsRoutes
      },
      {
        path: 'management',
        children: managementRoutes
      }
    ]
  }
];

export default router;
