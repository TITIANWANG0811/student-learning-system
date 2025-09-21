import { useState, useEffect } from 'react';

interface ResponsiveBreakpoints {
  xs: boolean;  // < 576px
  sm: boolean;  // >= 576px
  md: boolean;  // >= 768px
  lg: boolean;  // >= 992px
  xl: boolean;  // >= 1200px
  xxl: boolean; // >= 1600px
}

interface ResponsiveState {
  isMobile: boolean;    // < 768px
  isTablet: boolean;    // >= 768px && < 992px
  isDesktop: boolean;   // >= 992px
  breakpoints: ResponsiveBreakpoints;
  width: number;
  height: number;
}

const breakpoints = {
  xs: 576,
  sm: 768,
  md: 992,
  lg: 1200,
  xl: 1600,
};

export const useResponsive = (): ResponsiveState => {
  const [state, setState] = useState<ResponsiveState>(() => {
    const width = window.innerWidth;
    const height = window.innerHeight;
    
    return {
      isMobile: width < breakpoints.sm,
      isTablet: width >= breakpoints.sm && width < breakpoints.md,
      isDesktop: width >= breakpoints.md,
      breakpoints: {
        xs: width < breakpoints.xs,
        sm: width >= breakpoints.xs && width < breakpoints.sm,
        md: width >= breakpoints.sm && width < breakpoints.md,
        lg: width >= breakpoints.md && width < breakpoints.lg,
        xl: width >= breakpoints.lg && width < breakpoints.xl,
        xxl: width >= breakpoints.xl,
      },
      width,
      height,
    };
  });

  useEffect(() => {
    const handleResize = () => {
      const width = window.innerWidth;
      const height = window.innerHeight;
      
      setState({
        isMobile: width < breakpoints.sm,
        isTablet: width >= breakpoints.sm && width < breakpoints.md,
        isDesktop: width >= breakpoints.md,
        breakpoints: {
          xs: width < breakpoints.xs,
          sm: width >= breakpoints.xs && width < breakpoints.sm,
          md: width >= breakpoints.sm && width < breakpoints.md,
          lg: width >= breakpoints.md && width < breakpoints.lg,
          xl: width >= breakpoints.lg && width < breakpoints.xl,
          xxl: width >= breakpoints.xl,
        },
        width,
        height,
      });
    };

    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  return state;
};

export default useResponsive;
