-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\16b_1196.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    for l_0_5 in (string.gmatch)(l_0_0, "[^|]+") do
      local l_0_2 = nil
      -- DECOMPILER ERROR at PC18: Confused about usage of register: R4 in 'UnsetPending'

      if (sysio.IsFileExists)(R4_PC18) and ((sysio.GetFileSize)(R4_PC18) <= 65536 or not 65536) then
        local l_0_9, l_0_10 = nil
        if (MpCommon.StringRegExpSearch)("(?i)(validationKey=\"C50B3C89CB21F4F1422FF158A5B42D0E8DB8CB5CDA1742572A487D9401E3400267682B202B746511891C1BAF47F8D25C07F6C39A104696DB51F17C529AD3CABE\"|validationKey=\"32E35872597989D14CC1D5D9F5B1E94238D0EE32CF10AA2D2059533DF6035F4F\"|validationKey=\"287c5d125d6b7e7223e1f719e3d58d17bb967703017e1bbe28618fac6c4501e910c7e59800b5d4c2edd5b0ed98874a3e952d60baf260d9d374a74c76cb741803\"|validationKey=\"21f090935f6e49c2c797f69bbaad8402abd2ee0b667a8b44ea7dd4374267a75d\"|validationKey=\"395bb0dafa02ba520edb43e7edf06bbfd72fc13a5209243270539e01074b0ea4\")", tostring((sysio.ReadFile)(R4_PC18, 0, (sysio.GetFileSize)(R4_PC18)))) then
          (bm.add_related_string)("MatchedConfig", l_0_8 .. "::" .. R13_PC52, bm.RelatedStringBMReport)
          return mp.INFECTED
        end
      end
    end
  end
  do
    return mp.CLEAN
  end
end

