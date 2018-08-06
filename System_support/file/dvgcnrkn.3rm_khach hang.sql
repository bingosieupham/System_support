select * from cn_theodoino where ma_dviqly in('PD1200','PD1300','PD0400','PD0200','PD0600','PD1600') and nam ='2015'  
and ma_khang in ('PD0400T098472','PD0400T083689','PD0400T074926','PD04000015288')
and tien_no <>0 and thue_no <>0 ;

select * from cn_theodoino where ma_dviqly='PD0500' and ma_khang in('PD05000136035');


delete from CMIS01.cn_hdon_tkhoan where id_hdon='1099218542' ;

select * from CMIS01.cn_hdon_tkhoan where id_hdon  in ('1099908285');

update CMIS01.cn_hdon_tkhoan  set ngay_nop = to_date('10/12/2016','dd/MM/yyyy')  where  ma_nhang = 'N08' and to_char(ngay_nop,'MM/dd/yyyy')='01/27/2015';


delete from cn_gdich_atm where id_hdon ='1099218542'; 

select* from CMIS01.CN_GDICH_ATM where id_hdon  in ('1099908285');

select* from cn_hdon_tkhoan where id_hdon in ('1097631360');

select * from CMIS01.cn_gdich_atm where id_hdon in ('1061287879','1063913619','1058547911');

delete cn_hdon_tkhoan where id_hdon='1062960999';

select * from CMIS01.D_NHANG_BANK where bankid = '970408';

select B.SO_PHATM from cn_theodoino a
full join  cn_hdon_tkhoan b on A.ID_HDON = B.ID_HDON 
full join  cn_gdich_atm c on B.ID_HDON = C.ID_HDON
where A.MA_KHANG ='PD02T677233' and B.ID_HDON = 991269606  and C.MA_GD= 760991;

select * from CMIS01.cn_gdich_atm where id_hdon='1063170399';

delete from cn_gdich_atm where id_hdon in ('994394883','994524606','993545004','994439732','992802359','994552496','994233683');
delete cn_gdich_atm where  id_hdon='1008915122';

select segment_name,segment_type,bytes/1024/1024/1024 GB
from dba_segments
where segment_type='TABLE' and segment_name in ('ELSTER_EVENT','ELSTER_LOADPROFILE','ELSTER_TSVH','ELSTER_CSC')

select owner,sum(bytes)/1024/1024/1024 schema_size_gig from dba_segments
group by owner;

select * from cn_theodoino a where TIEN_NO <> 0 
and not exists (select 1 from cn_hdon_tkhoan where id_hdon = a.id_hdon)
and rownum<=100
