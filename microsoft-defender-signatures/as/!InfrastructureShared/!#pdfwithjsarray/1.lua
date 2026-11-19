-- Threat: !InfrastructureShared
-- Name: !#pdfwithjsarray
-- Type: 13
-- MpAttributes: pdfwithjsarray

mp.readprotection(false)
local l_0_0 = mp.get_parent_filehandle()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.get_filesize_by_handle(l_0_0)
if 500000 < l_0_1 then
  return mp.CLEAN
end
if l_0_1 < 8192 then
  return mp.CLEAN
end
local l_0_2 = mp.readfile_by_handle(l_0_0, 4096, 4096)
mp.vfo_add_buffer(l_0_2, "[pdfwithjsarray]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
