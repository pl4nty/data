-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11fb3118cf320\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
if not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[6]).utf8p1)
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC76: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC77: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC79: Overwrote pending register: R5 in 'AssignReg'

if ("\\certutil.exe")("\\certreq.exe", "\\mmc.exe") then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC89: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC90: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC91: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC92: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC93: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC94: Overwrote pending register: R5 in 'AssignReg'

for l_0_7,l_0_8 in ("\\windows\\system32\\")("\\programdata\\microsoft\\crypto\\") do
  -- DECOMPILER ERROR at PC97: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R12 in 'AssignReg'

  if (("\\w3wp.exe").find)("\\letsencrypt", "\\openssl.exe", "\\dotnet.exe", true) then
    return mp.CLEAN
  end
end
local l_0_9 = {}
-- DECOMPILER ERROR at PC119: No list found for R4 , SetList fails

local l_0_10 = {}
-- DECOMPILER ERROR at PC121: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC122: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC123: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC124: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC125: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC126: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC128: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC129: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC130: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC131: Overwrote pending register: R8 in 'AssignReg'

do
  do
    if not ("\\temp\\")("\\appdata\\local\\temp\\", "\\downloads\\") then
      local l_0_11, l_0_12, l_0_13 = contains(l_0_0, l_0_10)
    end
    -- DECOMPILER ERROR at PC139: Confused about usage of register: R6 in 'UnsetPending'

    if not l_0_11 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_file)(l_0_0)
    add_parents()
    -- DECOMPILER ERROR at PC152: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC153: Overwrote pending register: R10 in 'AssignReg'

    TrackPidAndTechniqueBM("BM", "\\desktop\\", "\\documents\\")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

