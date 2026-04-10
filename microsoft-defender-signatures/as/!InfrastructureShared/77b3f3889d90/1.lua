-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\77b3f3889d90\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
if (string.find)(l_0_0, "/node_modules/", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC61: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC62: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC64: Overwrote pending register: R5 in 'AssignReg'

if ("/dpkg")("/apt", "/yum", true) then
  return mp.CLEAN
end
local l_0_3 = (string.find)(l_0_0, "/resources/", 1, true)
do
  do
    if l_0_3 then
      local l_0_4 = (string.sub)(l_0_0, 1, l_0_3 - 1)
      -- DECOMPILER ERROR at PC91: Overwrote pending register: R8 in 'AssignReg'

      if (string.find)(l_0_1, l_0_4, "/brew", true) then
        return mp.CLEAN
      end
    end
    ;
    (bm.add_related_file)((this_sigattrlog[2]).utf8p1)
    TrackPidAndTechniqueBM("BM", "T1218.015", "SuspElectronNodeLoadXP")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

