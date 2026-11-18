-- Threat: !InfrastructureShared
-- Name: 32b3a730cacb
-- Type: 21

if this_sigattrlog[1].matched and string.find(this_sigattrlog[1].utf8p1, "LLMPrompt_Malicious_B", 1, true) and this_sigattrlog[1].utf8p2 then
  bm.add_related_string("Evidence", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
end
return mp.INFECTED
