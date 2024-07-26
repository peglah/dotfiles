/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#458488",     /* after initialization */
	[INPUT] =  "#d79921",   /* during input */
	[FAILED] = "#CC3333",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 60;

/* insert grid pattern with scale 1:1, the size can be changed with logosize */
static const int logosize = 75;
/* grid width and height for right center alignment */
static const int logow = 8;
static const int logoh = 13;

static XRectangle rectangles[9] = {
	/* x    y       w       h */
  { 0,    1,      1,      9 },
  { 1,   10,      1,      4 },
  { 1,    4,      5,      1 },
  { 2,    8,      4,      1 },
  { 2,   10,      3,      1 },
  { 5,   10,      1,      4 },
  { 6,    0,      1,     10 },
  { 2,    5,      1,      2 },
  { 4,    5,      1,      2 },
};

/*Enable blur*/
#define BLUR
/*Set blur radius*/
static const int blurRadius=5;
/*Enable Pixelation*/
//#define PIXELATION
/*Set pixelation radius*/
static const int pixelSize=0;
