import {
  Box,
  Container,
  Grid,
  Typography,
  styled
} from '@mui/material';
import { useTranslation } from 'react-i18next';

const TypographyH1 = styled(Typography)(
  ({ theme }) => `
    font-size: ${theme.typography.pxToRem(50)};
`
);

const TypographyH2 = styled(Typography)(
  ({ theme }) => `
    font-size: ${theme.typography.pxToRem(17)};
`
);

const LabelWrapper = styled(Box)(
  ({ theme }) => `
    background-color: ${theme.colors.success.main};
    color: ${theme.palette.success.contrastText};
    font-weight: bold;
    border-radius: 30px;
    text-transform: uppercase;
    display: inline-block;
    font-size: ${theme.typography.pxToRem(11)};
    padding: ${theme.spacing(0.5)} ${theme.spacing(1.5)};
    margin-bottom: ${theme.spacing(2)};
`
);

function Hero() {
  const { t }: { t: any } = useTranslation();

  return (
    <Container maxWidth="lg">
      <Grid
        spacing={{ xs: 6, md: 10 }}
        justifyContent="center"
        alignItems="center"
        container
      >
        <Grid item xs={12} pr={{ xs: 0, md: 3 }}>
          <LabelWrapper color="success">{t('Version') + ' 3.1'}</LabelWrapper>
          <TypographyH1
            sx={{
              mb: 2
            }}
            variant="h1"
          >
            Jewelry Manager
          </TypographyH1>
          <TypographyH2
            sx={{
              lineHeight: 1.5,
              pb: 4
            }}
            variant="h4"
            color="text.secondary"
            fontWeight="normal"
          >
            A full-stack inventory and sales tracker for jewelry businesses. Manage stock, track sales, engage customers, and gain insights with real-time analytics.
          </TypographyH2>
        </Grid>
      </Grid>
    </Container>
  );
}

export default Hero;
