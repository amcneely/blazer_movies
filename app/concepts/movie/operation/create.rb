class Movie::Operation::Create < Trailblazer::Operation
  success :log_start
  step Model( Movie, :new )
  step Contract::Build( constant: Movie::Contract::Create )
  step Contract::Validate( key: "movie" )
  step Contract::Persist()
  success :log_finish

  def log_start(ctx, params:, **)
    Rails.logger.debug "DEBUG: MOVIE OP START - ctx #{ctx.inspect} params #{params}"
  end

  def log_finish(ctx, params:, **)
    Rails.logger.debug "DEBUG: MOVIE OP FINISH - ctx #{ctx.inspect} params #{params}"
  end
end
