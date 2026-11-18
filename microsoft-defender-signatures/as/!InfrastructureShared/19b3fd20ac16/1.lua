-- Threat: !InfrastructureShared
-- Name: 19b3fd20ac16
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = l_0_0:match("^(.-)\\\\(.-)$")
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3
  if string.match(string.lower(l_0_1), "^hklm") then
    do
      local l_0_4 = sysio.RegOpenKey(l_0_1)
      if not l_0_4 then
        return mp.CLEAN
      end
      l_0_3 = sysio.GetRegValueAsBinary(l_0_4, l_0_2)
      if not l_0_3 then
        return mp.CLEAN
      end
    end
  elseif string.match(string.lower(l_0_1), "^hkcu") then
    local l_0_5 = sysio.RegExpandUserKey(l_0_1)
    if l_0_5 then
      for l_0_6, l_0_7 in pairs(l_0_5) do
        if string.find(string.lower(l_0_7), "hkcu@s-1-5-21-", 1, true) then
          local l_0_8 = sysio.RegOpenKey(l_0_7)
          if l_0_8 then
            l_0_3 = sysio.GetRegValueAsBinary(l_0_8, l_0_2)
            if l_0_3 then
              break
            end
          end
        end
      end
    end
  end
  if l_0_3 then
    local l_0_9 = MpCommon.BinaryRegExpSearch("MZ", l_0_3)
    if l_0_9 then
      local l_0_10 = MpCommon.BinaryRegExpSearch("This program cannot be run in DOS mode", l_0_3)
      if l_0_10 then
        bm.trigger_sig("RegistrySetBinaryDataMZ", l_0_0)
      end
    end
  end
end
return mp.CLEAN
