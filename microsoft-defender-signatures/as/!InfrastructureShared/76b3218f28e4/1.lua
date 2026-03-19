-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\76b3218f28e4\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC67: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC68: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("\\certutil.exe")("\\certreq.exe") do
  -- DECOMPILER ERROR at PC72: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R11 in 'AssignReg'

  if (("\\inetinfo.exe").find)("\\w3wp.exe", "\\letsencrypt", "\\openssl.exe", true) then
    return mp.CLEAN
  end
end
local l_0_8 = {}
-- DECOMPILER ERROR at PC91: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC92: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC93: Overwrote pending register: R5 in 'AssignReg'

for l_0_12,l_0_13 in ("\\windows\\system32\\")("\\programdata\\microsoft\\crypto\\") do
  if (string.find)(l_0_0, l_0_13, 1, true) then
    return mp.CLEAN
  end
end
local l_0_14 = {}
-- DECOMPILER ERROR at PC120: No list found for R4 , SetList fails

local l_0_15 = false
-- DECOMPILER ERROR at PC122: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC123: Overwrote pending register: R7 in 'AssignReg'

for l_0_19,l_0_20 in ("\\temp\\")("\\appdata\\local\\temp\\") do
  -- DECOMPILER ERROR at PC126: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC128: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC129: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC130: Overwrote pending register: R14 in 'AssignReg'

  if (("administrator.pfx").find)("admin.pfx", "domain_admin", "\\pwsh.exe", true) then
    break
  end
end
do
  do
    if not l_0_15 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_file)(l_0_0)
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1649", "susp_pfx_file_drop")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

