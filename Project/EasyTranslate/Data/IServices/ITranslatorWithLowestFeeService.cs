using Data.ViewModels;

namespace Data.IServices;

public interface ITranslatorWithLowestFeeService
{
    public IEnumerable<TranslatorWithLowestFee> GetTranslatorsWithLowestFees();
    public IEnumerable<TranslatorWithLowestFee> GetTranslatorFeesFromLowestToHighest();
}