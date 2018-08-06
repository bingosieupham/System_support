select * from cn_theodoino where tien_no <> 0 and thang = 12 and nam = 2017;

---kiem tra cong to treo thao nhung khong luong kiem dinh

select * from dd_bdong_cto where ma_ddo ='PD02000015799001'; update dd_bdong_htai set ma_tbi ='505201010008469'  where ma_ddo ='PD02000015799001' and ma_dviqly ='PD0200'

select * from dd_bdong_htai where ma_ddo ='PD02000015799001';

select * from dd_bcs_cto where ma_ddo ='PD02000015799001';

select * from gcs_chiso where ma_ddo ='PD02000015799001' and ma_dviqly ='PD0200';

--thong tin luon kiem dinh

select * from dd_kdinh_cto where ma_cto ='505201010008469';

select * from dd_kho_cto where ma_cto ='5065062009008469';

select * from dd_hoso_cto where ma_cto ='5065062009008469';

-----packgae chuan hoa so ghi chi so 
exec cmis01.CHUAN_HOA_CTO.bosung_cto_thieu('PD0200','09008469','506', '2014', 'E','01/01/2014');

select * from d_sogcs where tinh_trang = 1 and ma_dviqly ='PD2900' and ma_sogcs in ('PD29913','PD29914','PD29915','PD29B7157','
PD29P861B','UH001','UH002','UH004','UH3KY','
UH3KY1','PD29C1162','P2920961','PD29009*9','
PD2900N61','PD29102','PD2920261','PD2982026','
PD2920771','PD2982077','PD298111','PD2981282','
PD2989003','PD2989004','PD2982076','PD2910282')