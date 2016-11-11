# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Time用
Time::DATE_FORMATS.merge!(
    default: "%Y/%m/%d %H:%M",
    date:     "%Y/%m/%d",
    time:     "%H:%M:%S",
    datetime: "%y/%m/%d %H:%M:%S",
    ymd:      "%Y/%m/%d",
    hm:       "%H:%M",
    ymd_jp:  "%Y年%m月%d日",
)

# Date用
Date::DATE_FORMATS.merge!(
    default: "%Y/%m/%d",
    ym:      "%Y%m",
    ym_jp:   "%Y年%m月",
    md:      "%m/%d",
)