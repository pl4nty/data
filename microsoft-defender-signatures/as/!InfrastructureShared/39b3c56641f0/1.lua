-- Threat: !InfrastructureShared
-- Name: 39b3c56641f0
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  for l_0_1 in string.gmatch(l_0_0, "[^|]+") do
    if sysio.IsFileExists(l_0_1) then
      local l_0_2 = sysio.GetFileSize(l_0_1)
      l_0_2 = 65536 < l_0_2 and 65536 or l_0_2
      local l_0_3 = tostring(sysio.ReadFile(l_0_1, 0, l_0_2))
      local l_0_4, l_0_5 = MpCommon.StringRegExpSearch("(?i)(validationKey=\"C50B3C89CB21F4F1422FF158A5B42D0E8DB8CB5CDA1742572A487D9401E3400267682B202B746511891C1BAF47F8D25C07F6C39A104696DB51F17C529AD3CABE\"|validationKey=\"32E35872597989D14CC1D5D9F5B1E94238D0EE32CF10AA2D2059533DF6035F4F\"|validationKey=\"287c5d125d6b7e7223e1f719e3d58d17bb967703017e1bbe28618fac6c4501e910c7e59800b5d4c2edd5b0ed98874a3e952d60baf260d9d374a74c76cb741803\"|validationKey=\"21f090935f6e49c2c797f69bbaad8402abd2ee0b667a8b44ea7dd4374267a75d\"|validationKey=\"395bb0dafa02ba520edb43e7edf06bbfd72fc13a5209243270539e01074b0ea4\")", l_0_3)
      if l_0_4 then
        bm.add_related_string("MatchedConfig", l_0_1 .. "::" .. l_0_5, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
