-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b37a04592e\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC35: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1, l_0_2 = (string.lower)((this_sigattrlog[2]).utf8p1), nil
    end
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_3 = nil
    local l_0_4 = nil
    if GetRollingQueueKeyValue("app_version_" .. l_0_1:match("(%w+%.exe)$"), l_0_3) ~= nil then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if not (sysio.GetPEFixedVersionInfo)(l_0_3) then
      return mp.CLEAN
    end
    local l_0_6 = nil
    local l_0_7 = ((sysio.GetPEFixedVersionInfo)(l_0_3)).FileVersion
    if not (sysio.GetPEVersionInfo)(l_0_3) then
      return mp.CLEAN
    end
    local l_0_8 = nil
    if l_0_7 == 0 or not ((sysio.GetPEVersionInfo)(l_0_3)).OriginalFilename then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC84: Confused about usage of register: R6 in 'UnsetPending'

    local l_0_9 = nil
    local l_0_10 = "app_version_" .. ((sysio.GetPEVersionInfo)(l_0_3)).OriginalFilename
    local l_0_11 = 31536000
    local l_0_12 = 50
    AppendToRollingQueue(l_0_10, l_0_3, Version_to_str(l_0_7), l_0_11, l_0_12)
    ;
    (bm.add_related_string)("AppVersionFixed", Version_to_str(l_0_7), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end

