-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\cbb30390a357\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_2 = ""
  if (string.byte)(((this_sigattrlog[1]).utf8p1):lower()) ~= (string.byte)("%") or ((string.match)((string.match)(((this_sigattrlog[1]).utf8p1):lower(), "%%common_appdata%%\\(.*)"), "^[%a]:\\[^\\]+\\(.*)")):find("\\", 1, true) == nil then
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 and (this_sigattrlog[4]).utf8p2 then
      l_0_2 = (this_sigattrlog[4]).utf8p1
      l_0_1 = mp.INFECTED
    else
      if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 and (this_sigattrlog[2]).utf8p2 then
        l_0_2 = (this_sigattrlog[2]).utf8p1
        l_0_1 = mp.INFECTED
      else
        if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 and (this_sigattrlog[3]).utf8p2 then
          l_0_2 = (this_sigattrlog[3]).utf8p1
          l_0_1 = mp.INFECTED
        end
      end
    end
    if l_0_1 == mp.INFECTED and (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
      local l_0_3 = nil
      ;
      (bm.add_related_string)("ransom_meta", safeJsonSerialize({type = l_0_2, cmd = (this_sigattrlog[1]).utf8p2}), bm.RelatedStringBMReport)
      -- DECOMPILER ERROR at PC141: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (bm.trigger_sig)("GenericRansomware:AAA", safeJsonSerialize({type = l_0_2, cmd = (this_sigattrlog[1]).utf8p2}))
      reportSessionInformation()
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

