-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:HTML/FakeCaptcha.SB
-- Type: 13
-- MpAttributes: (SCPT:HTMLFile | Html_file | Nscript:Type_js)

if #mp.enum_mpattributesubstring("scpt:SCPTPhishHTMLFakeChaSB_gr_s") == 4 and #mp.enum_mpattributesubstring("scpt:SCPTPhishHTMLFakeChaSB_gr_v") >= 1 and 1 <= #mp.enum_mpattributesubstring("scpt:SCPTPhishHTMLFakeChaSB_gr_ctrl") and 1 <= #mp.enum_mpattributesubstring("scpt:SCPTPhishHTMLFakeChaSB_gr_enter") then
  return mp.INFECTED
end
return mp.CLEAN
