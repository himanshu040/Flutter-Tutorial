
//const String BASE_URL = " http://10.247.51.161:8080/pmscapi/auth/";
const String BASE_URL = "https://nsp.gov.in/pmscapi/";


const String GENERATE_OTP="auth/login";
const String VERIFY_OTP="auth/verifyOtp";
const String ENCRYPT_OTP="util/OtpPasswordEncode";
const String FAQ="mst/faqs";
const String MARK_FAVORITE="mark/favorite";
const String APPLICATION_LIST="mobileUser/applicantsList";
const String FAVORITE_LIST="favorite/applicantList";
const String SEARCH_LIST="search/byApplicantId";

const String APPLICATION_STATUS="status/getpmscApplicationStatus";
const String GET_RESPONDENT_TYPE = "api/list/getRespondentType/respondent";
const String GET_SURVEY_TYPE = "api/list/getSurveyType/surveyType";
const String REFRESH_TOKEN = "custom_token/auth/refresh";
const String DASHBOARD_DATA = "api/count/dashboard/dashboard";
const String USER_ME = "api/v1/user/get_user_roles";
const String GENERATE_SURVEY_LINK =
    "api/create/generateSurveyLink/generateSurveyLink";
const String RESEND_OTP = "custom/auth/resendotp";
const String VERSION = "custom/master/version";
