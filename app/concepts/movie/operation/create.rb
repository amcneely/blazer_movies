class Movie::Operation::Create < Trailblazer::Operation
  step :log_start
  step Model( Movie, :new )
  step Contract::Build( constant: Movie::Contract::Create )
  step Contract::Validate()
  step Contract::Persist()
  step :log_finish

  def log_start(ctx, params:, **)
    puts "MOVIE OPERATION START - ctx #{ctx.inspect} params #{params}"
    true
  end

  def log_finish(ctx, params:, **)
    puts "MOVIE OPERATION FINISH - ctx #{ctx.inspect} params #{params}"
    true
  end
end
