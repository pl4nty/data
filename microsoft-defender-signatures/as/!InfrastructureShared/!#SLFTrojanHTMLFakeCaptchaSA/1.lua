-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:HTML/FakeCaptcha.SA
-- Type: 13
-- MpAttributes: (SCPT:HTMLFile | Html_file | Nscript:Type_js)

if #mp.enum_mpattributesubstring("SCPT:Phish:HTML/FakeCha.SA") >= 6 then
  return mp.INFECTED
end
return mp.CLEAN
