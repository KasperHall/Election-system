function UpdateVotePlot(votePlot, voteCount)

  for i = 1:size(voteCount, 2)
    set(votePlot(i), 'YData', voteCount(:, i))
  end

end