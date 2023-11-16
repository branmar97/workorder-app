SET check_function_bodies = false;
CREATE TABLE public.address (
    address_id uuid DEFAULT gen_random_uuid() NOT NULL,
    address1 text NOT NULL,
    address2 text,
    city text NOT NULL,
    state text NOT NULL,
    zip_code text NOT NULL
);
CREATE TABLE public.approver (
    approver_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    work_order_id uuid NOT NULL,
    approved boolean DEFAULT false NOT NULL,
    date_submitted timestamp without time zone
);
CREATE TABLE public.asset (
    asset_id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    tag_number text NOT NULL,
    asset_type_id integer NOT NULL,
    date_acquired timestamp without time zone,
    last_service_date timestamp without time zone,
    asset_address_id uuid,
    client_id uuid NOT NULL
);
CREATE TABLE public.client (
    client_id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL
);
CREATE TABLE public.issue (
    issue_id uuid DEFAULT gen_random_uuid() NOT NULL,
    issue_type_id integer NOT NULL,
    description text
);
CREATE TABLE public.lkp_asset_type (
    asset_type_id integer NOT NULL,
    name text NOT NULL,
    description text
);
COMMENT ON TABLE public.lkp_asset_type IS 'Company asset types';
CREATE SEQUENCE public.lkp_asset_type_asset_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.lkp_asset_type_asset_type_id_seq OWNED BY public.lkp_asset_type.asset_type_id;
CREATE TABLE public.lkp_issue_type (
    issue_type_id integer NOT NULL,
    name text NOT NULL,
    description text
);
COMMENT ON TABLE public.lkp_issue_type IS 'Issue lookup';
CREATE SEQUENCE public.lkp_issue_type_issue_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.lkp_issue_type_issue_type_id_seq OWNED BY public.lkp_issue_type.issue_type_id;
CREATE TABLE public.lkp_urgency (
    urgency_id integer NOT NULL,
    name text NOT NULL,
    description text
);
CREATE SEQUENCE public.lkp_urgency_urgency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.lkp_urgency_urgency_id_seq OWNED BY public.lkp_urgency.urgency_id;
CREATE TABLE public.lkp_work_order_status (
    status_id integer NOT NULL,
    name text NOT NULL,
    description text
);
CREATE SEQUENCE public.lkp_work_order_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.lkp_work_order_status_status_id_seq OWNED BY public.lkp_work_order_status.status_id;
CREATE TABLE public."user" (
    user_id uuid DEFAULT gen_random_uuid() NOT NULL,
    auth_id text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    phone text,
    title text,
    client_id uuid NOT NULL
);
CREATE TABLE public.work_order (
    work_order_id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    requestor_name text NOT NULL,
    requestor_phone text NOT NULL,
    requestor_email text NOT NULL,
    requestor_fax text,
    requestor_address_id uuid,
    urgency_id integer NOT NULL,
    expected_start_date timestamp without time zone,
    expected_completion_date timestamp without time zone,
    date_started timestamp without time zone,
    date_completed timestamp without time zone,
    client_id uuid NOT NULL,
    created_by uuid NOT NULL,
    status_id integer NOT NULL
);
CREATE TABLE public.work_order_asset (
    work_order_asset_id uuid DEFAULT gen_random_uuid() NOT NULL,
    work_order_id uuid NOT NULL,
    asset_id uuid NOT NULL
);
ALTER TABLE ONLY public.lkp_asset_type ALTER COLUMN asset_type_id SET DEFAULT nextval('public.lkp_asset_type_asset_type_id_seq'::regclass);
ALTER TABLE ONLY public.lkp_issue_type ALTER COLUMN issue_type_id SET DEFAULT nextval('public.lkp_issue_type_issue_type_id_seq'::regclass);
ALTER TABLE ONLY public.lkp_urgency ALTER COLUMN urgency_id SET DEFAULT nextval('public.lkp_urgency_urgency_id_seq'::regclass);
ALTER TABLE ONLY public.lkp_work_order_status ALTER COLUMN status_id SET DEFAULT nextval('public.lkp_work_order_status_status_id_seq'::regclass);
ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);
ALTER TABLE ONLY public.approver
    ADD CONSTRAINT approver_pkey PRIMARY KEY (approver_id);
ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (asset_id);
ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (issue_id);
ALTER TABLE ONLY public.lkp_asset_type
    ADD CONSTRAINT lkp_asset_type_name_key UNIQUE (name);
ALTER TABLE ONLY public.lkp_asset_type
    ADD CONSTRAINT lkp_asset_type_pkey PRIMARY KEY (asset_type_id);
ALTER TABLE ONLY public.lkp_issue_type
    ADD CONSTRAINT lkp_issue_type_pkey PRIMARY KEY (issue_type_id);
ALTER TABLE ONLY public.lkp_issue_type
    ADD CONSTRAINT lkp_issue_type_type_name_key UNIQUE (name);
ALTER TABLE ONLY public.lkp_urgency
    ADD CONSTRAINT lkp_urgency_name_key UNIQUE (name);
ALTER TABLE ONLY public.lkp_urgency
    ADD CONSTRAINT lkp_urgency_pkey PRIMARY KEY (urgency_id);
ALTER TABLE ONLY public.lkp_work_order_status
    ADD CONSTRAINT lkp_work_order_status_name_key UNIQUE (name);
ALTER TABLE ONLY public.lkp_work_order_status
    ADD CONSTRAINT lkp_work_order_status_pkey PRIMARY KEY (status_id);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_auth_id_key UNIQUE (auth_id);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
ALTER TABLE ONLY public.work_order_asset
    ADD CONSTRAINT work_order_asset_pkey PRIMARY KEY (work_order_asset_id);
ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_pkey PRIMARY KEY (work_order_id);
ALTER TABLE ONLY public.approver
    ADD CONSTRAINT approver_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.approver
    ADD CONSTRAINT approver_work_order_id_fkey FOREIGN KEY (work_order_id) REFERENCES public.work_order(work_order_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_asset_address_id_fkey FOREIGN KEY (asset_address_id) REFERENCES public.address(address_id) ON UPDATE RESTRICT ON DELETE SET NULL;
ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_asset_type_id_fkey FOREIGN KEY (asset_type_id) REFERENCES public.lkp_asset_type(asset_type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_issue_type_id_fkey FOREIGN KEY (issue_type_id) REFERENCES public.lkp_issue_type(issue_type_id) ON DELETE SET NULL;
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.work_order_asset
    ADD CONSTRAINT work_order_asset_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.asset(asset_id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.work_order_asset
    ADD CONSTRAINT work_order_asset_work_order_id_fkey FOREIGN KEY (work_order_id) REFERENCES public.work_order(work_order_id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id) ON UPDATE RESTRICT ON DELETE CASCADE;
ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_created_by_fkey FOREIGN KEY (created_by) REFERENCES public."user"(user_id) ON UPDATE RESTRICT ON DELETE SET NULL;
ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_requestor_address_id_fkey FOREIGN KEY (requestor_address_id) REFERENCES public.address(address_id) ON UPDATE RESTRICT ON DELETE SET NULL;
ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.lkp_work_order_status(status_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_urgency_id_fkey FOREIGN KEY (urgency_id) REFERENCES public.lkp_urgency(urgency_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
