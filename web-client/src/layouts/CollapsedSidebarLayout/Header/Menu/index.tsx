import {
  Box,
  List,
  ListItem,
  ListItemText,
  styled
} from '@mui/material';
import { useTranslation } from 'react-i18next';

import { NavLink, useLocation } from 'react-router-dom';

const ListWrapper = styled(Box)(
  ({ theme }) => `
        .MuiTouchRipple-root {
            display: none;
        }
        
        .MuiListItem-root {
            transition: ${theme.transitions.create(['color', 'fill'])};
            
            &.MuiListItem-indicators {
                padding: ${theme.spacing(1, 2)};
            
                .MuiListItemText-root {
                    .MuiTypography-root {
                        &:before {
                            height: 4px;
                            width: 22px;
                            opacity: 0;
                            visibility: hidden;
                            display: block;
                            position: absolute;
                            bottom: -10px;
                            transition: all .2s;
                            border-radius: ${theme.general.borderRadiusLg};
                            content: "";
                            background: ${theme.colors.primary.main};
                        }
                    }
                }

                &.active,
                &:active,
                &:hover {
                
                    background: transparent;
                
                    .MuiListItemText-root {
                        .MuiTypography-root {
                            &:before {
                                opacity: 1;
                                visibility: visible;
                                bottom: 0px;
                            }
                        }
                    }
                }
            }
        }
`
);

function HeaderMenu() {
  const { t }: { t: any } = useTranslation();
  const location = useLocation();

  return (
    <>
      <ListWrapper>
        <List disablePadding component={Box} display="flex">
          <ListItem
            classes={{ root: 'MuiListItem-indicators' }}
            button
            component={NavLink}
            to={`/${location.pathname.split('/')[1]}/management/users`}
          >
            <ListItemText
              primaryTypographyProps={{ noWrap: true }}
              primary={t('Users')}
            />
          </ListItem>
          <ListItem
            classes={{ root: 'MuiListItem-indicators' }}
            button
            component={NavLink}
            to={`/${location.pathname.split('/')[1]}/dashboards/banking`}
          >
            <ListItemText
              primaryTypographyProps={{ noWrap: true }}
              primary={t('Banking')}
            />
          </ListItem>
        </List>
      </ListWrapper>
    </>
  );
}

export default HeaderMenu;
