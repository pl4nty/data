-- Threat: !InfrastructureShared
-- Name: SetAttributeFromClassifierScoresEx
-- Type: 1

function SetAttributeFromClassifierScoresEx(l_1_0, l_1_1, l_1_2)
  for l_1_3, l_1_4 in ipairs(l_1_1) do
    if l_1_4 <= l_1_0 then
      mp.set_mpattribute(l_1_2 .. l_1_4)
      
      break
    end
  end
end
