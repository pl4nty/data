-- Threat: !InfrastructureShared
-- Name: !#LUA:ZipRar7ZFileSize.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_ZIP_FILE | BM_7Z_FILE | BM_RAR_FILE)

local l_0_0 = mp.getfilesize()
if l_0_0 <= 120000000 then
  mp.set_mpattribute("//LUA:ZipRar7ZFileLE120M.A")
end
if l_0_0 <= 80000000 then
  mp.set_mpattribute("//LUA:ZipRar7ZFileLE80M.A")
end
if l_0_0 <= 40000000 then
  mp.set_mpattribute("//LUA:ZipRar7ZFileLE40M.A")
end
if l_0_0 <= 10000000 then
  mp.set_mpattribute("//LUA:ZipRar7ZFileLE10M.A")
end
if l_0_0 <= 5000000 then
  mp.set_mpattribute("//LUA:ZipRar7ZFileLE5M.A")
end
if l_0_0 <= 1000000 then
  mp.set_mpattribute("//LUA:ZipRar7ZFileLE1M.A")
end
return mp.CLEAN
