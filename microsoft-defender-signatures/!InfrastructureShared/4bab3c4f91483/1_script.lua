-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4bab3c4f91483\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[5]).utf8p1 == "" or (this_sigattrlog[8]).matched) and (this_sigattrlog[8]).utf8p1 ~= nil and (this_sigattrlog[8]).utf8p1 ~= "" then
      local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6 = (this_sigattrlog[5]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

    if (not (this_sigattrlog[9]).matched or (this_sigattrlog[9]).utf8p1 == nil or (this_sigattrlog[9]).utf8p1 == "" or (this_sigattrlog[9]).utf8p1 ~= nil) and (sysio.IsFileExists)((this_sigattrlog[9]).utf8p1) then
      (bm.add_threat_file)((this_sigattrlog[9]).utf8p1)
    end
    local l_0_7 = nil
    if (SuspMacPathsToMonitor((bm.get_imagepath)(), true) or (string.find)((bm.get_imagepath)(), "/Users/[^/]+/Downloads/", 1, false) or (string.find)((bm.get_imagepath)(), "/Users/[^/]+/Documents/", 1, false) or (string.find)((bm.get_imagepath)(), "/Users/[^/]+/Desktop/", 1, false)) and (sysio.IsFileExists)((bm.get_imagepath)()) then
      (bm.add_threat_file)((bm.get_imagepath)())
    end
    return mp.INFECTED
  end
end

