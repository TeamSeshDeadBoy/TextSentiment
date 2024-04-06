from transformers import AutoTokenizer, AutoModelForSequenceClassification
import os


def main():
    # get tokenizer
    tokenizer = AutoTokenizer.from_pretrained("finiteautomata/bertweet-base-sentiment-analysis")

    # get model
    model = AutoModelForSequenceClassification.from_pretrained("finiteautomata/bertweet-base-sentiment-analysis")

    # initialize path
    dir_path = os.path.dirname(os.path.realpath(__file__))

    # save tokenizer
    tokenizer.save_pretrained(dir_path+"/my_tokenizer/")

    # save model
    model.save_pretrained(dir_path+"/my_model/")


if __name__ == "__main__":
    main()