-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4d8b3328a18cd\0x00000e2c_luac 

-- params : ...
-- function num : 0
do
  if ((((this_sigattrlog[25]).matched and (this_sigattrlog[25]).utf8p2) or ((this_sigattrlog[26]).matched and (this_sigattrlog[26]).utf8p2) or ((this_sigattrlog[27]).matched and (this_sigattrlog[27]).utf8p2) or (this_sigattrlog[28]).matched)) then
    local l_0_0, l_0_1 = (this_sigattrlog[28]).utf8p2
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 then
    local l_0_2 = nil
    if isnull((string.match)(l_0_0, "Uri=([^;]+)")) then
      return mp.CLEAN
    end
    if not isValidLocalDomain((string.match)(l_0_0, "Uri=([^;]+)")) then
      local l_0_3, l_0_4 = , (mp.CheckUrl)((string.match)(l_0_0, "Uri=([^;]+)"))
      if l_0_4 == 1 and (string.match)(l_0_0, "Uri=([^;]+)") == 1 then
        return mp.CLEAN
      end
      local l_0_5 = nil
      if (string.match)(l_0_3, "^https?://") then
        local l_0_6 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "SUSPBITSCREATE-F", PROCESS_CONTEXT = "bitsadmin.exe", FILELESS = "true", CMDLINE_URL = "true"}
        local l_0_7 = SafeGetUrlReputation
        l_0_7 = l_0_7({l_0_3}, l_0_6, false, 3000)
        if (l_0_7.urls)[l_0_3] and ((l_0_7.urls)[l_0_3]).determination == 2 and ((l_0_7.urls)[l_0_3]).confidence >= 60 then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
  do
    return mp.CLEAN
  end
end

