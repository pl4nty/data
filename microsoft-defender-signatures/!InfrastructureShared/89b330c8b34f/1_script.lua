-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\89b330c8b34f\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = nil
  else
  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

  do
    if (((this_sigattrlog[4]).matched and (string.lower)((this_sigattrlog[4]).utf8p1) == nil) or ((string.find)((string.lower)((this_sigattrlog[4]).utf8p1), "\\microsoft\\exchange server\\v[1-9][0-9]\\frontend\\") == nil and (string.find)((string.lower)((this_sigattrlog[4]).utf8p1), "\\frontend\\httpproxy\\owa\\", 1, true) == nil and (string.find)((string.lower)((this_sigattrlog[4]).utf8p1), "\\inetpub\\wwwroot\\", 1, true) == nil and (string.find)((string.lower)((this_sigattrlog[4]).utf8p1), "\\microsoft\\exchange server\\v[1-9][0-9]\\clientaccess\\") == nil) or IsExchangeServer()) then
      local l_0_8 = nil
      if (string.match)((string.lower)((this_sigattrlog[4]).utf8p1), "(.*\\)[^\\]+$") then
        (bm.trigger_sig)("TriggerShellPath", (string.match)((string.lower)((this_sigattrlog[4]).utf8p1), "(.*\\)[^\\]+$"))
      end
      ;
      (mp.ReportLowfi)(l_0_8, 1067831818)
      ;
      (bm.add_related_file)(l_0_8)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

