-- Threat: !InfrastructureShared
-- Name: SetAttributeFromClassifierScores
-- Type: 1

function SetAttributeFromClassifierScores(l_1_0, l_1_1)
  for l_1_2, l_1_3 in pairs(l_1_1) do
    if l_1_3 <= l_1_0 then
      mp.set_mpattribute(l_1_2)
    end
  end
end
