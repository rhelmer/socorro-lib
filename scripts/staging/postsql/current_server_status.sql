

CREATE OR REPLACE VIEW current_server_status AS
    SELECT server_status.date_recently_completed, server_status.date_oldest_job_queued, date_part('epoch'::text, (server_status.date_created - server_status.date_oldest_job_queued)) AS oldest_job_age, server_status.avg_process_sec, server_status.avg_wait_sec, server_status.waiting_job_count, server_status.processors_count, server_status.date_created FROM server_status ORDER BY server_status.date_created DESC LIMIT 1;


ALTER TABLE public.current_server_status OWNER TO breakpad_rw;

REVOKE ALL ON TABLE current_server_status FROM PUBLIC;
REVOKE ALL ON TABLE current_server_status FROM breakpad_rw;
GRANT ALL ON TABLE current_server_status TO breakpad_rw;
GRANT SELECT ON TABLE current_server_status TO monitoring;


