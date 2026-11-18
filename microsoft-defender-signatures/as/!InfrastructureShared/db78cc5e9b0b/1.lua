-- Threat: !InfrastructureShared
-- Name: db78cc5e9b0b
-- Type: 21

local l_0_0 = pe.query_import(pe.IMPORT_STATIC, 3781839709)
if 0 ~= l_0_0 then
  return mp.INFECTED
end
local l_0_1 = pe.query_import(pe.IMPORT_STATIC, 3358620111)
if 0 ~= l_0_1 then
  return mp.INFECTED
end
local l_0_2 = pe.query_import(pe.IMPORT_STATIC, 4213996749)
if 0 ~= l_0_2 then
  return mp.INFECTED
end
local l_0_3 = pe.query_import(pe.IMPORT_STATIC, 2125492999)
if 0 ~= l_0_3 then
  return mp.INFECTED
end
local l_0_4 = pe.query_import(pe.IMPORT_STATIC, 890811841)
if 0 ~= l_0_4 then
  return mp.INFECTED
end
local l_0_5 = pe.query_import(pe.IMPORT_STATIC, 4180176840)
if 0 ~= l_0_5 then
  return mp.INFECTED
end
local l_0_6 = pe.query_import(pe.IMPORT_STATIC, 1497271799)
if 0 ~= l_0_6 then
  return mp.INFECTED
end
local l_0_7 = pe.query_import(pe.IMPORT_STATIC, 3287693681)
if 0 ~= l_0_7 then
  return mp.INFECTED
end
local l_0_8 = pe.query_import(pe.IMPORT_STATIC, 2455191392)
if 0 ~= l_0_8 then
  return mp.INFECTED
end
if mp.get_mpattribute("HSTR:Adware:Win32/Lollipop_Check_ARG") then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT > 21 and peattributes.suspicious_image_version then
  return mp.INFECTED
end
return mp.LOWFI
