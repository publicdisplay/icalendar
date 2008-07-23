=begin
  Copyright (C) 2005 Jeff Rose

  This library is free software; you can redistribute it and/or modify it
  under the same terms as the ruby language itself, see the file COPYING for
  details.
=end
module Icalendar
  # A Freebusy calendar component is a grouping of
  # component properties that represents either a request for, a reply to
  # a request for free or busy time information or a published set of
  # busy time information.
  class Freebusy < Component
    # Single properties
    ical_property :contact
    ical_property :dtstart, :start
    ical_property :dtend, :end
    ical_property :dtstamp, :timestamp
    ical_property :duration
    ical_property :organizer
    ical_property :uid, :user_id
    ical_property :url

    # Multi-properties
    ical_multiline_property :attendee, :attendee, :attendees
    ical_multi_property :comment, :comment, :comments
    ical_multiline_property :freebusy, :freebusy, :freebusys
    ical_multi_property :request_status, :request_status, :request_statuses

    # As of 7/22/2008, Google Calendar violates RFC2445 by permitting the
    # following properties of VFREEBUSY components.
    ical_multi_property :rdate, :recurrence_date, :recurrence_dates
    ical_multi_property :rrule, :recurrence_rule, :recurrence_rules
    ical_multi_property :exdate, :exception_date, :exception_dates
    ical_multi_property :exrule, :exception_rule, :exception_rules

    def initialize()
      super("VFREEBUSY")

      timestamp DateTime.now
      uid new_uid
    end
  end
end
