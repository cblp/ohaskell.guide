{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE MultiWayIf #-}

module Chapters (
      chaptersURLsNNames
    , chaptersURLs
    , chaptersNames
    , chapterURLByName
) where

import qualified Data.Text as T

-- Главы перечислены в Оглавлении в таком же порядке.
chaptersURLsNNames :: [(T.Text, T.Text)]
chaptersURLsNNames = [ ("/init.html",                     "Приветствую!")
                     , ("/haskell-faq.html",              "Первые вопросы")
                     , ("/this-book.html",                "Об этой книге")
                     , ("/setup.html",                    "Приготовимся")
                     , ("/whales-n-turtle.html",          "Киты и Черепаха")
                     , ("/immutability-n-purity.html",    "Неизменность и чистота")
                     , ("/if-n-return.html",              "Выбираем и возвращаемся")
                     , ("/choose-n-patterns.html",        "Выбор и образцы")
                     , ("/let-n-where.html",              "Пусть будет там, Где...")
                     , ("/operators.html",                "Мир операторов")
                     , ("/list.html",                     "Список: знакомство")
                     , ("/tuple.html",                    "Кортеж")
                     , ("/lambda-function.html",          "Лямбда-функция")
                     , ("/function-composition.html",     "Композиция функций")
                     , ("/hof.html",                      "ФВП")
                     , ("/hackage.html",                  "Hackage и библиотеки")
                     --, ("/list-generators.html",          "Генераторы списков")
                     -- , ("/recursion.html",                "Рекурсия")
                     -- , ("/laziness.html",              "Лень")
                     , ("/own-types.html",                "Наши типы")
                     , ("/adt.html",                      "АТД")
                     , ("/adt-field-labels.html",         "АТД: поля с метками")
                     -- , ("/.html",                    "Конструктор типа") 5
                     -- , ("/.html",                    "Практика: фантомный тип") 5
                     -- , ("/.html",                    "Функтор")
                     -- , ("/.html",                    "Аппликативный функтор") 10
                     -- , ("/.html",                    "Монада") 10
                     -- , ("/.html",                    "Монадный трансформер") 10
                     -- , ("/.html",                    "Stackage") 3
                     -- , ("/.html",                    "форматирование") 3
                     -- , ("/demystification.html",          "Демистификация Haskell")
                     ]

chaptersURLs :: [T.Text]
chaptersURLs = [url | (url, _) <- chaptersURLsNNames]

chaptersNames :: [T.Text]
chaptersNames = [name | (_, name) <- chaptersURLsNNames]

chapterURLByName :: T.Text -> Maybe T.Text
chapterURLByName aName =
    let urls = [if aName == name then url else "" | (url, name) <- chaptersURLsNNames]
        realUrls = filter (not . T.null) urls
    in if | null realUrls -> Nothing
          | otherwise     -> Just $ head realUrls

