-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanHTMLFakeCaptchaSB\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("scpt:SCPTPhishHTMLFakeChaSB_gr_s") == 4 and #(mp.enum_mpattributesubstring)("scpt:SCPTPhishHTMLFakeChaSB_gr_v") >= 1 and #(mp.enum_mpattributesubstring)("scpt:SCPTPhishHTMLFakeChaSB_gr_ctrl") >= 1 and #(mp.enum_mpattributesubstring)("scpt:SCPTPhishHTMLFakeChaSB_gr_enter") >= 1 then
  return mp.INFECTED
end
return mp.CLEAN

