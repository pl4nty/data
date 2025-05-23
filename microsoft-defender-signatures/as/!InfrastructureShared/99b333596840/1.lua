-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\99b333596840\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1 = nil, nil
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  local l_0_3 = nil
  if GetRollingQueueKeyValue("app_version_" .. l_0_0:match("(%w+%.exe)$"), l_0_2) == nil then
    local l_0_4 = nil
    if (sysio.GetPEFixedVersionInfo)(l_0_2) == nil then
      return mp.CLEAN
    end
    local l_0_5 = nil
    local l_0_6 = "app_version_" .. l_0_3
    local l_0_7 = 31536000
    if l_0_5.FileVersion ~= 0 then
      local l_0_8 = 50
      AppendToRollingQueue(l_0_6, l_0_2, Version_to_str(l_0_5.FileVersion), l_0_7, l_0_8)
      ;
      (bm.add_related_string)("SQLVersion", Version_to_str(l_0_5.FileVersion), bm.RelatedStringBMReport)
    else
      do
        do
          ;
          (bm.add_related_string)("SQLVersion", "ERROR", bm.RelatedStringBMReport)
          -- DECOMPILER ERROR at PC75: Confused about usage of register: R2 in 'UnsetPending'

          ;
          (bm.add_related_string)("SQLVersion", l_0_4, bm.RelatedStringBMReport)
          return mp.INFECTED
        end
      end
    end
  end
end

